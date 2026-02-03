from fastapi.testclient import TestClient
import app

client = TestClient(app.app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
