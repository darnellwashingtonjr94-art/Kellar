from fastapi import FastAPI
from app.routes import router

app = FastAPI(
    title="A-Q-U-A-R-I-U-S",
    description="LLM Routing Backend for Kellar",
    version="1.0.0"
)

app.include_router(router)

@app.get("/health")
async def health_check():
    return {"status": "online", "subsystems": "operational"}
