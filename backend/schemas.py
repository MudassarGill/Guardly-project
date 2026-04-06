from typing import Optional, List
from datetime import datetime
from pydantic import BaseModel, ConfigDict

class UserCreate(BaseModel):
    email: str
    password: str
    full_name: str
    user_type: str

class UserLogin(BaseModel):
    email: str
    password: str

class Token(BaseModel):
    access_token: str
    token_type: str

class RuleCreate(BaseModel):
    child_id: int
    rule_type: str
    rule_value: str

class AppUsageCreate(BaseModel):
    app_package: str
    app_name: str
    usage_minutes: int
    date: str

class BlockAppRequest(BaseModel):
    child_id: int
    app_package: str
    app_name: str

class LockDeviceRequest(BaseModel):
    child_id: int
