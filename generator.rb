r = Random.new
RandomHex1 = "0x"
RandomHex1 << r.rand(0..1024).to_s(16)


r = Random.new
RandomHex2 = "0x"
RandomHex2 << r.rand(0..1024).to_s(16)


Operator1 = ["^","|","&"]
operator = Operator1[Random.new.rand(0..2)]


Task = "int a = #{RandomHex1};
int b = #{RandomHex2};
int result = a#{operator}b;"

File.open("test.c", "w") do |file|
	file<<"#include<stdio.h>

			int main(){
  				#{Task};
  				printf(\"0x\");
  				printf(\"%d\",result); 
   			return 0; 
			} 			"
end 
print Task, "\n"
print "result= ", `gcc test.c && ./a.out`
`rm test.c a.out`