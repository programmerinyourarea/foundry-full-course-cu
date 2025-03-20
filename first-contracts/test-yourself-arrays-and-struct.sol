// SPDX-License-Identifier: MIT
pragma solidity 0.8.29; //latest solidity version
struct Animal{
    string animalType;
    string name;
    uint age;
   }
contract Answer{
   Animal[] public animalList;
   bool private friendsAdded =false;
   function addFriends()public {
    require(!friendsAdded);
    Animal memory cl203 = Animal("Cat","CL203",13);
    Animal memory kryptoDog = Animal("Dog", "Krypto", 77);
    Animal memory tiny = Animal("Kitten","Tiny",4);
    animalList.push(cl203);
    animalList.push(kryptoDog);
    animalList.push(tiny);
    friendsAdded=true;
   }
   function addAnimal(Animal memory _newAnimal)public{
    animalList.push(_newAnimal);
   }
}