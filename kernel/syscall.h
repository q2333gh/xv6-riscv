// System call numbers
#define SYS_fork    1    // Create a new process by duplicating the existing process. Returns the child process ID to the parent and 0 to the child.
#define SYS_exit    2    // Terminate the current process. Does not return.
#define SYS_wait    3    // Wait for a child process to terminate. Returns the process ID of the terminated child.

#define SYS_pipe    4    // Create a pipe (an inter-process communication channel). Returns 0 on success, -1 on failure.

#define SYS_read    5    // Read data from a file descriptor. Returns the number of bytes read, or -1 on error.

#define SYS_kill    6    // Send a signal to a process. Returns 0 on success, -1 on failure.
#define SYS_exec    7    // Execute a new program in the current process. Does not return on success, -1 on failure.

#define SYS_fstat   8    // Get file status information. Returns 0 on success, -1 on failure.
#define SYS_chdir   9    // Change the current directory. Returns 0 on success, -1 on failure.
#define SYS_dup    10    // Duplicate a file descriptor. Returns the new file descriptor on success, -1 on failure.

#define SYS_getpid 11    // Get the process ID of the current process. Returns the process ID.

#define SYS_sbrk   12    // Increase/decrease the program's data space (allocate/deallocate memory). Returns the previous program break address.

#define SYS_sleep  13    // Suspend the execution of the current process for a specified amount of time. Returns 0 on success.

#define SYS_uptime 14    // Get the system uptime (time since boot). Returns the uptime value.

#define SYS_open   15    // Open a file. Returns the file descriptor on success, -1 on failure.
#define SYS_write  16    // Write data to a file descriptor. Returns the number of bytes written, or -1 on error.
#define SYS_mknod  17    // Create a device file (special file). Returns 0 on success, -1 on failure.
#define SYS_unlink 18    // Delete a file. Returns 0 on success, -1 on failure.
#define SYS_link   19    // Create a hard link to a file. Returns 0 on success, -1 on failure.
#define SYS_mkdir  20    // Create a directory. Returns 0 on success, -1 on failure.
#define SYS_close  21    // Close a file descriptor. Returns 0 on success, -1 on failure.