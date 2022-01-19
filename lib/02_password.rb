#02_password.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022
# Troisème programme Ruby utilisant des méthodes & Co
# A lancer sur un terminal en plein écran pour bénéficier des "graphismes" ASCII ;-)

# Inclusion de bibliothèques au besoin
require 'io/console' #(utile uniquement si invocation de "IO::console.getpass" pour saisie aveugle du mot de passe)

# draw_marquee - Affichage de la bannière de Your Keep 2.0
# IN  : -
# DO  : Affiche la bannière Your Keep 2.0
# OUT : -
def draw_marquee(title)
  puts
  puts
  puts  "##################################################"
  puts  "#  "+title+(" "*(50-6-title.length))+"  #"
  puts  "##################################################"
  puts  "#   _____.___.________   ____ _____________      #"
  puts  "#   \\__  |   |\\_____  \\ |    |   \\______    \\    #"
  puts  "#    /   |   | /   |   \\|    |   /|       _/     #"
  puts  "#    \\____   |/    |    \\    |  / |    |   \\     #"
  puts  "#    / ______|\\_______  /______/  |____|_  /     #"
  puts  "#    \\/               \\/                 \\/      #"
  puts  "#   ____  __.________________________________    #"
  puts  "#  |    |/ _|\\_   _____/\\_   _____/\\______   \\   #"
  puts  "#  |      <   |    __)_  |    __)_  |     ___/   #"
  puts  "#  |    |  \\  |        \\ |        \\ |    |       #"
  puts  "#  |____|__ \\/_______  //_______  / |____| 2.0   #"
  puts  "#          \\/        \\/         \\/               #"
  puts  "##################################################"
end

# signup - Enregistrement des login et mot de passe
# IN  : 
# DO  : 
# OUT : 
def signup
  draw_marquee("Welcome to Your Keep 2.0 signup page")
  puts  "##################################################"
  puts  "#                                                #"
  puts  "#  To SIGN UP, please first provide us with the  #"
  puts  "#  identification information below...           #"
  puts  "#                                                #"
  print "#    1) Input your first name: "
  $firstname=gets.chomp
  puts  "#                                                #"
  print "#    2) Enter your lastname: "
  $lastname=gets.chomp
  puts  "#                                                #"
  print "#    3) Choose a login: "
  $login=gets.chomp
  puts  "#                                                #"
  print "#    4) Enter the desired password: "
  # $password=gets.chomp
  $password=IO::console.getpass
  puts  "#                                                #"
  puts  "##################################################"
  puts  "#                                                #"
  puts  "#        INFORMATION SUCCESSFULLY SAVED          #"
  puts  "#               - Thank you -                    #"
  puts  "#                                                #"
  puts  "##################################################"
  puts
  #puts "Recorded info: |"+$firstname+"|"+$lastname+"|"+$login+"|"+$password+"|"
  puts
end


# login - Connexion
# IN  : 
# DO  : 
# OUT : 
def login
  while $attempt <= 3 do
    draw_marquee("Welcome to Your Keep 2.0 login page (#{$attempt}/3)")
    puts  "##################################################"
    puts  "#                                                #"
    puts  "#  To LOGIN, please type in your identification  #"
    puts  "#  information below... (Attempt #{$attempt}/3)            #"
    puts  "#                                                #"
    print "#    Login: "
    provided_login=gets.chomp
    puts  "#                                                #"
    print "#    Password: "
    # provided_password=gets.chomp
    provided_password=IO::console.getpass
    puts  "#                                                #"
    puts  "##################################################"
    if (provided_login==$login) && (provided_password==$password)
      $attempt=1
      welcome_screen
      break
    else
      $attempt+=1
      if $attempt> 3
        deny_screen
      else
        login # Appel récursif - Attention au branchement de retour !
        break
      end
    end
  end
end


# welcome_screen - Affichage de l'écran d'accueil uniquement à un utilisateurs enregistré
# IN  : -
# DO  : Affiche l'en-tête avec un message de bien venue
# OUT : -
def welcome_screen
  draw_marquee("LOGGED IN USER: #{$firstname} #{$lastname}")
  puts  "#                                                #"
  puts  "#      Houlala ! Que voilà des informations      #"
  puts  "#                                                #"
  puts  "#                [TOP SECRET]                    #"
  puts  "#                                                #"
  puts  "##################################################"
  puts 
  puts
end


# deny_screen - Affichage de l'écran de rejet au bout de 3 login erronés
# IN  : 
# DO  : 
# OUT : 
def deny_screen
  draw_marquee("#{$firstname} #{$lastname} - ACCESS DENIED")
  puts
  puts
end


# perform - Programme principal
# IN  : -
# DO  : A invocation, ****
# OUT : -
def perform
  $firstname=""
  $lastname=""
  $login=""
  $password=""
  $attempt=1
  system "clear" # Attention à la portabilité - "clear" fonctionne uniquement sur X-terminal pas DOS
  signup
  login
  puts
  puts " - FIN DU PROGRAMME -"
end

# Invocation de la méthode "Programme principal"
perform


# Ameliorations possibles
#  - Limitation des longueurs de certaines chaînes (ex: password...)
#  - Test plus complet des longueurs de chaînes (ex: affichage en-tête marquee)
#  - Ajouter une menu de choix (log in, sign up, reset account...) auquel on reviendrait
#  - Ajouter une gestion d'utilisateurs multiples, via des tableaux de tableaux
#  - Gestion moins mécanique / systématique des 3 tentatives + test sur login / password
#  - Dissimulation de la saisie du password via un "IO::console.getpass" ou "$stdin.noecho(&:gets)"
#  - Etc.
#

# Fin du code
#02_password.rb by Jean-Baptiste VIDAL for THP Developpeur Hiver 2022