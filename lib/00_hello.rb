#00_hello.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022
# Premier programme Ruby utilisant des méthodes


# say_hello - Méthode affichant "Bonjour <prenom> !"
# IN  : un prénom (String)
# DO  : affiche "Bonjour <prénom> !"
# OUT : nil (car utilisation de "puts")
def say_hello (jbFirstName)
  puts "Bonjour " + jbFirstName + " !"
end


# ask_firstname - Méthode récupérant la saisie d'un prénom par un utilisateur
# IN  : un prénom (String)
# DO  : affiche "Bonjour <prénom> !"
# OUT : nil (car utilisation de "puts")
def ask_first_name
  puts "Entrez un prénom, s'il-vous-plaît ?"
  print "> "
  return gets.chomp
end


# perform - Programme principal
# IN  : -
# DO  : A son appel, lance "ask_firstname" puis "say_hello"
# OUT : -
def perform
  first_name = ask_first_name
  say_hello(first_name)
end


# Appel de la méthode principale
perform


# Fin du code
#00_hello.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022