top="""-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- Quartus Prime generated Memory Initialization File (.mif)

WIDTH=8;
DEPTH=256;

ADDRESS_RADIX=UNS;
DATA_RADIX=UNS;

CONTENT BEGIN"""
bottom="""END;"""

table=""

def createMem(label, table):
    cont=0
    for i in label:
        table=table+"	"+str(cont)+"    :   "+str(i)+"\n"
        cont=cont+1
    table=table+"	["+str(cont)+"...255]"+"    :   0"
    return table

def ascii_convert(text):
    ascii_values = []
    for character in text:
        ascii_values.append(ord(character))
    return ascii_values

def file_Mem(text):
    with open('MemoryInit.mif', 'w') as f:
        f.write(text)
        f.close()

text = input("Digite la frase:")
textAscii=[]
textAscii=ascii_convert(text)
table = createMem(textAscii, table)
finalText=top+"\n"+table+"\n"+bottom
file_Mem(finalText)
