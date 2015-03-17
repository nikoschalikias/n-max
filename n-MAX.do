# Template Do File For Protel 99 -> Specctra Autorouter
# Protel International Pty Ltd
# 25-Jun-1999
#
unit mil
bestsave on F:\orcad4\orcad\n-Max\n-MAX.bst
status_file F:\orcad4\orcad\n-Max\n-MAX.sts
grid smart (wire 1) (via 1)
smart_route
critic

#enable the spread and miter features if you have the DFM option
#spread
#miter

# If you have the DFM module use spread and miter instead of the following. 
# Comment these lines out
Center
Recorner Diagonal 2000 2000 2000
Recorner Diagonal 1000 1000 1000
Recorner Diagonal 500 500 500
Recorner Diagonal 250 250 250
Recorner Diagonal 125 125 125
Recorner Diagonal 100 100 100
Recorner Diagonal 50 50 50
Recorner Diagonal 25 25 25
Recorner Diagonal 10 10 10
# Stop commenting here if you have the DFM module


write  routes      F:\orcad4\orcad\n-Max\n-MAX.rte
write  wires       F:\orcad4\orcad\n-Max\n-MAX.w
report conflicts   F:\orcad4\orcad\n-Max\n-MAX.rcf
report corners     F:\orcad4\orcad\n-Max\n-MAX.rcn
report rules       F:\orcad4\orcad\n-Max\n-MAX.rrl
report status      F:\orcad4\orcad\n-Max\n-MAX.rst
report unconnect   F:\orcad4\orcad\n-Max\n-MAX.ruc
report vias        F:\orcad4\orcad\n-Max\n-MAX.rva
quit
