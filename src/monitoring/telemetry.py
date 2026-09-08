import time
import psutil

def collect_system_metrics():
    while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        mem_info = psutil.virtual_memory()
        
        telemetry = {
            "timestamp": time.time(),
            "cpu_percent": cpu_usage,
            "memory_percent": mem_info.percent
        }
        
        # Log telemetry or stream to monitoring dashboard
        time.sleep(5)

if __name__ == "__main__":
    # collect_system_metrics()
    pass
