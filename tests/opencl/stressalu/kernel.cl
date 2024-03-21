__kernel void stressalu (__global const int *A,
	                    __global int *C)
{
  int gid = get_global_id(0);
  int a = A[gid];
  int c = 0;
  #pragma unroll 10
  for (int i = 0; i< 1000; i++) {
    c += a * gid;
    c ^= a;
  }
  C[gid] = c;
  
}