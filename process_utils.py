import uuid
import datetime

def process_lab_result(data):
    """
    Recibe un dict con el lab result.
    Devuelve un dict listo para DynamoDB.
    """

    result_id = str(uuid.uuid4())

    item = {
        "result_id": result_id,
        "patient_id": data["patient_id"],
        "lab_id": data["lab_id"],
        "lab_name": data["lab_name"],
        "test_type": data["test_type"],
        "timestamp": datetime.datetime.utcnow().isoformat(),
        "results": data["results"],  # DynamoDB JSON friendly
        "notes": data.get("notes", "")
    }

    return item
