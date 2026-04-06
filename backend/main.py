from fastapi import FastAPI, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas, auth
from database import engine, get_db
import random
import string

# Create the database tables
models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Guardly Backend APIs")

@app.get("/")
def read_root():
    return {"status": "Guardly APIs are running successfully"}

@app.post("/api/auth/register", response_model=schemas.Token)
def register(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.email == user.email).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    hashed_password = auth.get_password_hash(user.password)
    new_user = models.User(
        email=user.email,
        password_hash=hashed_password,
        full_name=user.full_name if user.full_name else "",
        user_type=user.user_type if user.user_type else "unknown"
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    
    # Generate Token
    access_token = auth.create_access_token(data={"sub": new_user.email, "id": new_user.id, "type": new_user.user_type})
    return {"access_token": access_token, "token_type": "bearer"}

@app.post("/api/auth/login", response_model=schemas.Token)
def login(user: schemas.UserLogin, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.email == user.email).first()
    if not db_user or not auth.verify_password(user.password, db_user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid Email or Password")
    
    # Generate Token
    access_token = auth.create_access_token(data={"sub": db_user.email, "id": db_user.id, "type": db_user.user_type})
    return {"access_token": access_token, "token_type": "bearer", "user_id": db_user.id}

@app.post("/api/pair/generate_otp", response_model=schemas.OTPResponse)
def generate_otp(parent_id: int, db: Session = Depends(get_db)):
    # Create 6 digit OTP
    otp_code = ''.join(random.choices(string.digits, k=6))
    
    # Store OTP
    store = models.OTPStore(parent_id=parent_id, otp_code=otp_code)
    db.add(store)
    db.commit()
    
    return {"otp_code": otp_code}

@app.post("/api/pair/link")
def link_account(child_id: int, request: schemas.LinkAccountRequest, db: Session = Depends(get_db)):
    store = db.query(models.OTPStore).filter(models.OTPStore.otp_code == request.otp_code).first()
    if not store:
        raise HTTPException(status_code=400, detail="InvalidOTP")
        
    # Link parent and child
    link = models.ParentChild(parent_id=store.parent_id, child_id=child_id)
    db.add(link)
    
    # Clean OTP
    db.delete(store)
    db.commit()
    
    return {"status": "success", "parent_id": store.parent_id}
