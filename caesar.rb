class CaesarCipher

	def encryption(string, key) 
			puts "your string fro encryption is #{string} and key #{key}"
			str = string.downcase.scan(/./)
			s2 = str.map do |s1|
				if s1.ord == 32
					32
				else
					s3= (s1.ord + key.to_i)
				end
			#s3 = (s1.ord + key.to_i)
			s3 > 122 ? (s3-26).chr : s3.chr
			end
			puts s2.join("")		
	end

	def decryption(string, key)
		puts "your string is #{string} and key #{key}"
			str = string.downcase.delete(" ").scan(/./)
			s2 = str.map do |s1|
				if s1.ord == 32
					s3 = 32
				else
					s3= (s1.ord - key.to_i)
				end
			s3 < 97 ? (s3+26).chr : s3.chr
			end
			puts s2.join("")		
	end	
end

cs = CaesarCipher.new
puts "enter the string for encryption or decryption"
string = gets
puts "E for encryption \n D for decryption"
flag = gets.chomp
puts "Enter the key"
key = gets
#cs.encryption(string, key)
if  flag == 'E'
	puts cs.encryption(string, key)	
elsif flag == 'D'
	puts cs.decryption(string, key)
else
	"not valid"
end