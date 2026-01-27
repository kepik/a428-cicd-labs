# 1. Class Animal
class Animal:
    def __init__(self, name, age, species):
        self.name = name
        self.age = age
        self.species = species

# 2. Class Cat (turunan dari Animal)
class Cat(Animal):
    def deskripsi(self):
        return f"{self.name} adalah kucing berjenis {self.species} yang sudah berumur {self.age} tahun"

    def suara(self):
        return "meow!"

# 3. Instance Cat
myCat = Cat("Neko", 3, "Persian")
print(myCat.deskripsi())
print(myCat.suara())