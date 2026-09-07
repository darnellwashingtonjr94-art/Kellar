from pydantic import BaseModel, Field
from typing import List, Optional

class TelemetryLog(BaseModel):
    process_id: str
    action_type: str = Field(description="The behavior observed, e.g., REGISTRY_EDIT")
    target_path: Optional[str] = None
    timestamp: str

class AnalysisRequest(BaseModel):
    logs: List[TelemetryLog]
    yara_matches: List[str]
    context_level: str = Field(default="standard", description="Controls verbosity of LLM response")

class MitigationResponse(BaseModel):
    threat_classification: str
    confidence_score: float
    recommended_action: str
    kellar_message: str = Field(description="The summary to display on the UI to the user")
