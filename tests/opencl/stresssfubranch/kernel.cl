__kernel void stresssfubranch (__global const int *A,
	                    __global int *C)
{
  int local_size = get_local_size(0);
  int gid = get_global_id(0);
  int lid = get_local_id(0);
  int a = A[gid];
  int c = 0;

  #pragma unroll 10
  for (int i = 0; i< 100; i++) {
    if (a%2 == 0) {
      c= 1;
    } else {
      if (a%3 ==0) {
        c= 2;
      }
    }
  }
  C[gid] = c;
}