#03_stairway.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022
# Quatrième programme Ruby utilisant des méthodes & Co
#
#
# [ REGLES ]
#
# A l'exécution, le programme lance une partie. 
# Le joueur est tout en bas d'un escalier à 10 marches.
# A chaque tour il va lancer un dé à 6 faces :
#
#   - S’il fait 5 ou 6, il avance d'une marche et le programme le lui dit (ainsi que la marche où il est à présent)
#   - S’il fait 1, il descend d'une marche et le programme le lui dit (ainsi que la marche où il est à présent)
#   - S’il fait 2, 3, ou 4 rien ne se passe, et le programme le lui dit (ainsi que la marche où il est resté)
#
# Quand le joueur atteint la 10ème et dernière marche, le programme le félicite et le jeu s'achève


# Portion réséervée pour inclusion d'éventuelles bibliothèques
#


# draw_marquee - Affichage de la bannière du jeu STAIRWAY 3.0
# IN  : -
# DO  : Affiche la bannière STAIRWAY 3.0
# OUT : -
def draw_marquee(tour)
  puts
  puts
  puts  "##################################################"
  puts  "#                 STAIRWAY 3.0                   #"
  puts  "##################################################"
  puts  "#                 Coup n° #{tour}"+(" "*(50-27-tour.to_s.length))+"#"
  puts  "##################################################"
  puts
  puts
end


# draw_dice - Affichage en ASCII du nombre tiré au dé (via "rand 1..6")
# IN  : face_number - résultat du tirage d edé, valeur entre 1 et 6
# DO  : Affiche une reproduction ASCII de la face de dé passée en paramètre
# OUT : nil (car utilisation de "puts")
def draw_dice(face_number)
  puts
  puts "  #######"
  case face_number
  when 1
    puts "  #     #"
    puts "  #  o  #"
    puts "  #     #"
  when 2
    puts "  # o   #"
    puts "  #     #"
    puts "  #   o #"
  when 3
    puts "  # o   #"
    puts "  #  o  #"
    puts "  #   o #"
  when 4
    puts "  # o o #"
    puts "  #     #"
    puts "  # o o #"
  when 5
    puts "  # o o #"
    puts "  #  o  #"
    puts "  # o o #"
  when 6
    puts "  # o o #"
    puts "  # o o #"
    puts "  # o o #"
  else
    puts "  #     #"
    puts "  # K O #"
    puts "  #     #"
    $play_again=FALSE
  end
  puts "  #######"
  puts
end


# right_pyramid - Affichage d'une pyramide droite / montante (Mario Bros' style)
# IN  : -
# DO  : Affiche une pyramide montante de "symbole" à "etages" niveaux
# OUT : nil (dernière évaluation sur "puts")
def right_pyramid(marche)
  $etages.times do |i|
    if i != ($etages-marche)
      puts " "*($etages-i)+$symbole*(i+1)+"  Etage n°: "+($etages-i).to_s
    else
      puts " "*($etages-i-1)+">"+$symbole*(i+1)+"  Etage n°: "+($etages-i).to_s
    end
  end
end #Fin right_pyramid


# perform - Programme principal
# IN  : -
# DO  : A invocation, **** A COMPLETER ****
# OUT : -
def perform
  coup = 1
  $play_again = TRUE
  $etages = 10
  $symbole = "#"
  niveau = 1

  while $play_again do
    system "clear" # Attention à la portabilité - "clear" fonctionne uniquement sur X-terminal pas MS-DOS & consorts a priori
    draw_marquee(coup)
    dice_6 = rand 1..6
    puts "Votre tirage de dé: "+dice_6.to_s
    draw_dice(dice_6)
    
    case dice_6
    when 1
      if niveau > 1
        niveau -= 1 # On descend d'une marche
      else
        niveau = 1
      end
    when 5, 6
      niveau += 1 # On monte d'une marche 
    else
      # On ne bouge pas 
    end

    right_pyramid(niveau)
    
    if niveau == $etages
      puts
      puts "Bravo !!!"
      puts "Vous êtes trop fort(e) ou chanceux(se): vous avez atteint le sommet !"
      puts
      $play_again = FALSE
    else
      puts
      print "Do you want to roll the dice again (y/n) ?"
      coup+=1
      $play_again = ((gets.chomp) == "y")
    end
  end

  puts
  puts "Merci d'avoir joué #{coup-1} fois avec nous !"
  puts
end


# Invocation de la méthode "Programme principal"
perform


# Fin du code
#03_stairway.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022