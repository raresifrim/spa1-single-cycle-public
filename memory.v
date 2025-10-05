module MEMORY(
    input wire [7:0] address,
    output reg [7:0] instr
);

    //memoria noastra cu dimensiunea cuvantului de 1 byte
    //si capacitatea totala de 256 de cuvinte (bytes in cazul nostru)
    reg [7:0] mem [0:255];

    integer i;
    initial begin
        for (i=0; i<=255; i=i+1)
            mem[i] = 8'h00; //initializam toata memoria cu 0x0
        //dupa care citim fisierul si inseram programul nostru la inceputul memoriei (adresa 0x0)
        $readmemb("code.mem", mem); //code.mem este fisierul ce contine programul nostru in limbaj masina (binar)
    end

    always@(*) begin
        //citim instructiunea de la adresa oferita ca input
        instr = mem[address];
    end

endmodule
