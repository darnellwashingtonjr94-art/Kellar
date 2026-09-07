from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import litellm

router = APIRouter()

class ThreatQuery(BaseModel):
    behavior_log: str
    urgency_level: str

@router.post("/analyze-threat")
async def analyze_threat(query: ThreatQuery):
    try:
        # Route to Gemini 3.1 Pro (or equivalent) for threat analysis
        response = litellm.completion(
            model="gemini/gemini-pro",
            messages=[
                {"role": "system", "content": "You are Kellar's intelligence core. Analyze this behavior log and provide a mitigation strategy."},
                {"role": "user", "content": query.behavior_log}
            ]
        )
        return {"advice": response.choices[0].message.content}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
