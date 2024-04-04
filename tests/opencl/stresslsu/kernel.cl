__kernel void stresslsu (__global const volatile int *A,
	                    __global int *C)
{
  int gid = get_global_id(0);
  int a;
  int c = 0;
  #pragma unroll 10
  for (int i = 0; i< 1000; i++) {
    a=A[gid];
    c=a;
    C[gid] = c;
  }
  
}