#01_pyramids.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022
# Deuxième programme Ruby utilisant des méthodes, des boucles et des branchements


# pyramids_init - Récupération des paramètres communs (symbole & etages) de tracé des pyramides
# IN  : -
# DO  : Stocke les 2 saisies utilisateurs dans "symbole" et "etages"
# OUT : nil (dernière évaluation sur "puts")
def pyramids_init
  puts "Choisissez le symbole avec lequel vous souhaitez voir dessinée votre pyramide (ex: '#'): "
  print "(1 caractère)> "
  $symbole=gets.chomp
  puts "Entrez la hauteur (nombre d'étages) que comptera la pyramide "
  print "(Nombre entre 1 et 25 inclus)> "
  $etages=gets.chomp.to_i
  puts
end


# left_pyramid - Affichage d'une pyramide gauche / descendante
# IN  : -
# DO  : Affiche une pyramide descendante de "symbole" à "etages" niveaux
# OUT : nil (dernière évaluation sur "puts")
def left_pyramid
  puts
  puts "[ PYRAMIDE GAUCHE / DESCENDANTE ]"
  puts
  $etages.times do |i|
    puts $symbole*(i+1)
  end
  puts
end #Fin left_pyramid


# right_pyramid - Affichage d'une pyramide droite / montante (Mario Bros' style)
# IN  : -
# DO  : Affiche une pyramide montante de "symbole" à "etages" niveaux
# OUT : nil (dernière évaluation sur "puts")
def right_pyramid
  puts
  puts "[ PYRAMIDE DROITE / MONTANTE ]"
  puts
  puts
  puts 
  puts "  ****************************"
  puts "  *                          *"
  puts "  *  It's meeee, Marioooo !  *"
  puts "  *                          *"
  puts "  ****************************"
  puts 
  $etages.times do |i|
    puts " "*($etages-i)+$symbole*(i+1)+"  Etage n°: "+($etages-i).to_s
  end
end #Fin right_pyramid


# symetrical_pyramid - Affichage d'une pyramide symétrique (Gizeh's style)
# IN  : -
# DO  : Affiche une pyramide isocèle de "symbole" à "etages" niveaux
# OUT : nil (dernière évaluation sur "puts")
def symetrical_pyramid
  $etages.times do |i|
    puts " "*($etages-i) + $symbole*(2*i+1)
  end
end #Fin symetrical_pyramid


# wtf_pyramid - Affichage d'un diamant (James Bond's style)
# IN  : -
# DO  : Affiche un losage "symbole" à "etages" niveaux
# OUT : nil (dernière évaluation sur "puts")
def wtf_pyramid
  ligne = ""
  mirror_tab = []
  if $etages.even? #nombre d'étages pair
    $etages.times do |i|
      if i<($etages/2)
        ligne = " "*($etages-i) + $symbole*(2*i+1)
        mirror_tab.push(ligne)
        puts ligne
      else
        break
      end
    end
    puts mirror_tab.reverse
  else  #nombre d'étages impair
    $etages.times do |i|
      if i<=($etages/2)
        ligne = " "*($etages-i) + $symbole*(2*i+1)
        mirror_tab.push(ligne)
        puts ligne
      else
        puts mirror_tab[$etages-i-1]
      end
    end
  end
end #Fin wtf_pyramid


# menu_pyramids - Menu de choix du type de pyramide à construire
# IN  : -
# DO  : Affiche un menu à 5 entrées + récupère le choix utilisateur + le branche sur l'option retenue
# OUT : nil (si dernière évaluation sur "puts"), sinon valeur renvoyée par la méthode (possiblement nil auss lorsque "puts" final)
def menu_pyramids
  puts "  ***************************************************************"
  puts "  *                                                             *"
  puts "  *  Choisissez le type de pyramide à construire pour Ramsès :  *"
  puts "  *                                                             *"
  puts "  *    1. Pyramide gauche / descendante                         *"
  puts "  *    2. Pyramide droite / montante (Mario Bros' style)        *"
  puts "  *    3. Pyramide symétrique (Gizeh's style)                   *"
  puts "  *    4. Pyramide WTF? (Diamonds Are Forever style)            *"
  puts "  *    5. [EXIT]>                                               *"
  puts "  *                                                             *"
  puts "  ***************************************************************"
  puts 
  puts "  Votre choix ?"
  print"  >"
  choix = gets.chomp.to_i
  puts
  case choix
  when 1
    left_pyramid
  when 2
    right_pyramid
  when 3
    symetrical_pyramid
  when 4
    wtf_pyramid
  when 5
    #Do nothing >> retourne à la fin de "main"
  else
    puts
    puts "/!"+"\\"+" WARNING /!"+"\\"
    puts "Il semblerait que votre saisie ne corresponde à aucun choix du menu"
    puts
  end
end #Fin menu_pyramids


# perform - Programme principal
# IN  : -
# DO  : A invocation, lance l'initialisation du programme puis, soit un WARNING, soit le menu de choix des pyramides 
# OUT : -
def perform
  $symbole ="#"
  $etages = 5
  pyramids_init
  if ($etages > 0) && ($etages <= 25)
    menu_pyramids
  else
    puts
    puts "/!"+"\\"+" WARNING /!"+"\\"
    puts "Il semblerait que vous ayez saisi autre chose qu'un nombre..."
    puts "ou qu'il n'était pas compris entre 1 et 25 (inclus) comme demandé..."
    puts "Vous êtes un(e) petit(e) farceur(se) mais Ramsès n'a pas trop d'humour !"
    puts
  end
  puts
  puts "- AU REVOIR ! -"
  puts
end #Fin main


# Invocation de la méthode "Programme principal"
perform


# Fin du code
#01_pyramids.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022