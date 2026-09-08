#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/tracepoint.h>

SEC("tracepoint/syscalls/sys_enter_execve")
int trace_execve(struct trace_event_raw_sys_enter* ctx) {
    char fmt[] = "[!] Execve system call intercepted by Kellar trace engine\n";
    bpf_trace_printk(fmt, sizeof(fmt));
    return 0;
}

char _license[] SEC("license") = "GPL";
