"""
Simple FastAPI application that exposes two endpoints:

- GET /health  → Basic health check for Kubernetes and monitoring.
- POST /predict → Returns a fake random "predicted" price for a given symbol.

This file focuses only on the HTTP API layer.
There is NO real machine learning model here, just a random number generator.
"""

from fastapi import FastAPI
import random

# Create the main FastAPI application instance.
# This "app" object is what Uvicorn will run inside the Docker container.
app = FastAPI(
    title="NN Predictor API",
    description="Toy API that simulates a neural network prediction by returning a random price.",
    version="1.0.0",
)


@app.get("/health")
def health_check():
    """
    Health-check endpoint.

    Purpose:
    - Allow Kubernetes (and other tools) to verify that the application is running.
    - If this endpoint returns {"status": "ok"}, we consider the service "healthy".

    Returns
    -------
    dict
        A very small JSON payload with a static status message.
    """
    return {"status": "ok"}


@app.post("/predict")
def predict(symbol: str):
    """
    Fake prediction endpoint.

    This simulates a "prediction" made by a machine learning model.
    In reality, it just returns a random integer inside a fixed range.

    Parameters
    ----------
    symbol : str
        Asset ticker sent by the client (for example: "BTC", "ETH", "AAPL"...).

    Returns
    -------
    dict
        A JSON object with:
        - "symbol": the same symbol that the client sent.
        - "price": a random integer between 20_000 and 60_000 (inclusive),
                   used as a fake "predicted" price.
    """

    # Generate a random price to simulate a model output.
    # 20_000 and 60_000 are just example bounds (similar to crypto prices).
    fake_price = random.randint(20_000, 60_000)

    # Build the response payload.
    # The client receives both the symbol and the fake price.
    return {
        "symbol": symbol,
        "price": fake_price,
    }
