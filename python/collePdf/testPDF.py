from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import LETTER
from reportlab.lib.units import inch, cm
from reportlab.pdfgen.canvas import Canvas
import csv

with open('colles.csv', newline = '') as csvfile:
     spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
     for row in spamreader:
         Lcolle = row
Lprofs = []
with open('profs.csv', newline = '') as csvfile:
     spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
     for row in spamreader:
         Lprofs.append(row)

# print(Lcolle)
# print(Lprof)
Ljours = []
Lhoraire = []
Lprof = []
Lsalle = []
Lmatiere = []
for i in range(len(Lcolle)) :
    for j in range(len(Lprofs)) :
        if Lcolle[i] == Lprofs[j][0] :
            Ljours.append(Lprofs[j][4] + " ")
            Lhoraire.append(Lprofs[j][5] + " ")
            Lprof.append(Lprofs[j][3] + " ")
            Lsalle.append(Lprofs[j][6] + " ")
            Lmatiere.append(Lprofs[j][1] + " ")
Lsemaine = []
for i in range(len(Lcolle)//2) :
    Lsemaine.append([[Ljours[2*i] + Lhoraire[2*i] + Lmatiere[2*i] + Lprof[2*i] + Lsalle[2*i]], [Ljours[2*i+1] + Lhoraire[2*i+1] + Lmatiere[2*i+1] + Lprof[2*i+1] + Lsalle[2*i+1]]])

# S = ""
# for i in range(len(Lsemaine)) :
#     S += "semaine " + str(i) + " " + str(Lsemaine[i][0]) + "<br />"
#     S += "semaine " + str(i) + " " + str(Lsemaine[i][1]) + "<br />"
canvas = Canvas("colles.pdf", pagesize=LETTER)

# Set font to Times New Roman with 12-point size
canvas.setFont("Times-Roman", 15)

# Draw blue text one inch from the left and ten
# inches from the bottom
# canvas.setFillColor(blue)
cm *= 0.5
for i in range(len(Lsemaine)) :
    canvas.drawString(1 * inch, 10 * inch - 1 * cm - 2*i * cm, "semaine " + str(i+1) + " " + str(Lsemaine[i][0][0]))
    canvas.drawString(1 * inch, 10 * inch - 1 * cm - (2*i +1) * cm, "semaine " + str(i+1) + " " + str(Lsemaine[i][1][0]))

# Save the PDF file
canvas.save()