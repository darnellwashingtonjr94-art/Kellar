import os
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    app_name: str = "A-Q-U-A-R-I-U-S Routing Node"
    # Fallback to a dummy key for local testing without crashing
    gemini_api_key: str = os.getenv("GEMINI_API_KEY", "dummy-key-for-local-dev")
    environment: str = os.getenv("ENVIRONMENT", "development")
    log_level: str = "INFO"

    class Config:
        env_file = ".env"

settings = Settings()
