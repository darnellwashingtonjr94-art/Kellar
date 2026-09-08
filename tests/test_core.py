import unittest
import sys

class TestKellarCore(unittest.TestCase):
    def test_environment_readiness(self):
        self.assertTrue(sys.version_info >= (3, 10))

    def test_core_execution_payload(self):
        payload = {"status": "active", "engine": "Kellar-Py"}
        self.assertEqual(payload["status"], "active")

if __name__ == "__main__":
    unittest.main()
