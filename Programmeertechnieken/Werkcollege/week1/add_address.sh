#!/bin/bash

read -p "First name: " name
read -p "Family name: " surname
read -p "Address: " address

echo $surname $name $address >>"./data/address.list"
