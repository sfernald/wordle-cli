# wordle-cli is wordle programmed in nim
# created to teach myself the Nim programming language

import strutils
import std/random

randomize()

var
  wordle: string
  lettersCorrect: int
  response: string
  guesses: int
  guess: string

let validWords = readFile("five-letter-words.txt")
let wordList = validWords.splitLines()
wordle = wordList[rand(len(wordList))-1]

while guesses < 6:
  echo "What is the wordle?"

  while 1==1:
    guess = readLine(stdin)
    if guess in wordList:
      break
    else:
      echo "Please use a real five letter word."

  response = ""
  lettersCorrect = 0

  for i, letter in guess:
    if wordle[i] == letter:
      response.add($letter & "*")
      inc lettersCorrect
    elif letter in wordle:
      response.add($letter & "+")
    else:
      response.add($letter & " ")

  if lettersCorrect == len(wordle):
    echo "Hey, you got the wordle!"
    break
  else:
    inc(guesses)
    echo "Sorry, wrong guess!"
    echo response

if guess != wordle:
  echo "Sorry, ran outta guesses!"
  echo "Wordle was " & wordle

