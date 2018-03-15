# QBASIC Front-End Terminal

# The intention of this software is to serve as a banking software product that accepts transactions from a 
# command line in a simple ATM-style. This file is the front-end, which the user interacts with to perform
# these transactions. This front-end will communicate with a back-end that will later be implemented.

# Notes:
# Argument 1: Input file
# Argument 2: Output file
# This program is intended to be run on a command line.
# No default input file, must set an argument in command line to have an input file for accounts
# Output file default file is transactionsummary.txt, can be changed with argument 2

# Library Imports
import sys

# Global Vars
loginState = 0  # No Login = 0, Machine = 1, Clerk = 2
accountsList = []  # Holds account input data
transactionsList = []  # Tracks all transactions
disabledList = []  # Track deleted accounts
withdrawTracker = []  # Track total amount withdrawn from machine accounts

# ----- Command Functions -----
# --- Login Function ---
    #Enables the user to login and prompts to login as Agent or Machine 
    #Will produce an error if it is an invalid command or user is already logged in
def login():
    global loginState
    if loginState != 0:  # Check if already logged in
        print("Invalid Command. Already logged in.")
        return
    while True:  # Prompt for machine/agent login
        print("Machine or Agent login?")
        userInput = input(">> ").lower()
        if userInput == "machine":  # Login as machine
            loginState = 1
            return
        elif userInput == "agent":  # Login as agent
            loginState = 2
            return
        elif userInput == "close":
            exit()
        else:  # Only allow machine/agent commands
            print("Invalid Command. Please login in as Machine or Agent.")

# --- Logout Function ---  
    #Enables user to logout of the current session, and if a transaction has occurred, it will be processed and a .txt file 
    #will be produced and proceed to prompt user to login
def logout():
    global loginState
    global transactionsList
    loginState = 0  # Reset login state
    try:
        outputFile = sys.argv[2]  # Check for output file name
    except:
        outputFile = 'transactionsummary.txt'  # Default output file name
    print("Logout Successful.")
    if transactionsList:  # Check if any transactions occurred
        with open(outputFile, 'w+') as file:
            for row in transactionsList:
                file.write(' '.join(row) + "\n")  # Join & write each row in transactionList list
            file.write("EOS 0000000 000 0000000 ***")  # EOS line
    transactionsList = []  # Reset transactions
    print("Welcome to QBASIC. Please login.")
    return

# --- Createacct Function ---
    #Enables a user logged in as a Agent to create a new account and name 
    #Will produce an error if account number and name already exists using a helper function, naming conventions does not
    #satisfy requirements, or an invalid command
def createacct():
    global accountsList
    global loginState
    global transactionsList
    if loginState != 2:  # Check login state for agent login
        print("Invalid Command. Must be in agent mode to create account.")
        return
    else:
        while True:  # Check account number input
            print("Please enter the new account number:")
            accNumInput = input(">> ")
            if accNumInput == "close":  # Close Function
                exit()
            if len(accNumInput) == 7:  # Check input number is 7 digits
                if accNumInput[0] != '0':  # Check first digit is not 0
                    if not validAccountNumberChecker(accNumInput):  # Check if account number already exists
                        break
                    else:
                        print("Invalid Command. Account number already exists.")
                else:
                    print("Invalid Command. Account Number cannot start with 0.")
            else:
                print("Invalid Command. Account Number must be 7 digits.")
        while True:  # Check account number name input
            print("Please enter the new account name:")
            nameInput = input(">> ")
            if nameInput == "close":  # Close Function
                exit()
            if 3 <= len(nameInput) <= 30:  # Check account name is between 3 - 30 characters
                if not (nameInput[0].isspace() or nameInput[len(nameInput)-1].isspace()):  # Check that name input first & last digits are not spaces
                    if validNameChecker(nameInput):  # Check if name only contains letters & spaces
                        break
                    else:
                        print("Invalid Command. Name can only contain letters and spaces.")
                else:
                    print("Invalid Command. Name cannot start or end with a space.")
            else:
                print("Invalid Command. Name must be between 3 to 30 characters.")
        print("Account successfully created.")
        transactionsList.append(["NEW", accNumInput, "000", "0000000", nameInput])  # Add account to transactionList
        return

# --- Deleteacct Function ---
    #Enables a user logged in as a Agent to delete an existing account
    #Will produce an error if account number and name is invalid by using a helper function, or an invalid command
def deleteacct():
    global transactionsList
    global accountsList
    global loginState
    global disabledList
    if loginState != 2:  # Check login state for agent login
        print("Invalid Command. Must be in agent mode to create account.")
        return
    else:
        while True:  # Check account number
            print("Please enter the account number:")
            accNumInput = input(">> ")
            if accNumInput == "close":  # Close Function
                exit()
            if validAccountNumberChecker(accNumInput):  # Check if the account number exists in the account input list
                break
            else:
                print("Invalid Command. Account Number does not exist.")
        while True:  # Check account name
            print("Please enter the account name:")
            nameInput = input(">> ")
            if nameInput == "close":  # Close Function
                exit()
            break
        print("Account deleted.")
        transactionsList.append(["DEL", accNumInput, "000", "0000000", nameInput])  # Add deletion to transactionList
        disabledList.append(accNumInput)  # Add account number to the disabled list
        return

# --- Deposit Function ---
    #Prompts the user in Agent or Machine mode the amount of money and which account is to be deposited
    #Will produce an error if account number is invalid or disabled using a helper function, amount exceeds the contraints, or an invalid command
def deposit():
    global transactionsList
    global loginState
    global disabledList
    while True:  # Check account number
        print("Please enter the account number to deposit to:")
        accNumInput = input(">> ")
        if accNumInput == "close":  # Close Function
            exit()
        if validAccountNumberChecker(accNumInput):  # Check if account number exists
            break
        elif accNumInput in disabledList:  # Check if account number is deleted
            print("Invalid Command. Account number disabled.")
        else:
            print("Invalid Command. Account number does not exist.")
    while True:  # Check deposit amount
        print("Please enter the amount you want to deposit:")
        depositInput = input(">> ")
        if depositInput == "close":  # Close Function
            exit()
        try:
            if int(depositInput) < 1:  # Deposit not 0 or negative value
                print("Invalid Command. Deposit amount must be greater than zero.")
            elif int(depositInput) > 100000 and loginState == 1:  # Check if machine limit reached
                print("Invalid Command. Over ATM deposit limit.")
            elif int(depositInput) > 99999999 and loginState == 2:  # Check if agent limit reached
                print("Invalid Command. Over Agent deposit limit.")
            else:
                break
        except ValueError:
            print("Invalid Command. Must be an integer.")
    print("Depositing $" + str(float(depositInput)/100) + " to account " + accNumInput)
    if 9 >= int(depositInput) >= 1:
        depositInput = "00" + depositInput
    elif 99 >= int(depositInput) >= 10:
        depositInput = "0" + depositInput
    transactionsList.append(["DEP", accNumInput, depositInput, "0000000", "***"])  # Add to transactionList
    return

# --- Withdraw Function ---
    #Prompts the user in Agent or Machine mode the amount of money and which account is to be withdrawn
    #Will produce an error if account number is invalid or disabled using a helper function, amount exceeds the contraints, or an invalid command
def withdraw():
    global transactionsList
    global loginState
    global disabledList
    while True:
        print("Please enter the account number to withdraw from:")
        accNumInput = input(">> ")
        if accNumInput == "close":  # Close Function
            exit()
        if validAccountNumberChecker(accNumInput):  # Check if account number exists
            break
        elif accNumInput in disabledList:  # Check if account is disabled
            print("Invalid Command. Account number disabled.")
        else:
            print("Invalid Command. Account number does not exist.")
    while True:
        print("Please enter the amount you want to withdraw:")
        withdrawInput = input(">> ")
        if withdrawInput == "close":  # Close Function
            exit()
        try:
            if int(withdrawInput) < 1:  # Check if withdraw amount is greater than zero
                print("Invalid Command. Withdraw amount must be greater than zero.")
            elif int(
                    withdrawInput) > 100000 and loginState == 1:  # Check that withdraw amount is below $1000.00 in machine login
                print("Invalid Command. Over ATM withdraw limit.")
            elif int(
                    withdrawInput) > 99999999 and loginState == 2:  # Check that withdraw amount is below $999,999.99 in agent login
                print("Invalid Command. Over Agent withdraw limit.")
            else:
                break
        except ValueError:
            print("Invalid Command. Must be an integer.")

    print("Withdrawing $" + str(float(withdrawInput)/100) + " from account " + accNumInput)
    if 9 >= int(withdrawInput) >= 1:
        withdrawInput = "00" + withdrawInput
    elif 99 >= int(withdrawInput) >= 10:
        withdrawInput = "0" + withdrawInput
    transactionsList.append(["WDR", accNumInput, withdrawInput, "0000000", "***"])  # Add to transactionList
    return

# --- Transfer Function ---
    #Prompts the user in Agent or Machine mode the amount of money and the accounts for the funds to be transfered
    #Will produce an error if account numbers are invalid or disabled using a helper function, amount exceeds the contraints, or an invalid command
def transfer():
    global transactionsList
    global loginState
    while True:
        print("Please enter the account number transfer from:")
        accNum1Input = input(">> ")
        if accNum1Input == "close":  # Close Function
            exit()
        if validAccountNumberChecker(accNum1Input):  # Check if account number exists
            break
        elif accNum1Input in disabledList:  # Check if disabled account
            print("Invalid Command. Account number disabled.")
        else:
            print("Invalid Command. Account number does not exist.")
    while True:
        print("Please enter the account number transfer to:")
        accNum2Input = input(">> ")
        if accNum2Input == "close":  # Close Function
            exit()
        if validAccountNumberChecker(accNum2Input):  # Check if account number exists
            break
        elif accNum2Input in disabledList:  # Check if disabled account
            print("Invalid Command. Account number disabled.")
        else:
            print("Invalid Command. Account number does not exist.")
    while True:
        print("Please enter the amount to transfer:")
        transferInput = input(">> ")
        if transferInput == "close":  # Close Function
            exit()
        try:
            if int(transferInput) < 1:  # Check if greater than zero
                print("Invalid Command. Transfer amount must be greater than zero.")
            elif int(transferInput) > 100000 and loginState == 1:  # Check if machine transfer is less than $1000.00
                print("Invalid Command. Over ATM transfer limit.")
            elif int(transferInput) > 99999999 and loginState == 2:  # Check if agent transfer is less than $999,999.99
                print("Invalid Command. Over Agent transfer limit.")
            else:
                break
        except ValueError:
            print("Invalid Command. Must be an integer.")
    print("Transfering $" + str(float(transferInput)/100) + " from account " + accNum1Input + " to " + accNum2Input)
    if 9 >= int(transferInput) >= 1:
        transferInput = "00" + transferInput
    elif 99 >= int(transferInput) >= 10:
        transferInput = "0" + transferInput
    transactionsList.append(["XFR", accNum1Input, transferInput, accNum2Input, "***"])  # Add to transactionList
    return

# ----- Setup Functions -----
# --- readAccounts Function ---
    #Reads into the validAccounts.txt file and parses each line, storing them in a global list called accountsList
def readAccounts():
    global accountsList
    try:
        inputFile = sys.argv[1]  # Check if argument exists
        with open(inputFile, 'r') as file:
            accountsList = [line.strip().rstrip('\n') for line in file]
    except:
        return  # If no argument exists, return no account file

# ----- Helper Function -----
# --- validNameChecker Function --- 
    #Takes a string account name as parameter, and checks that it only contains spaces and alphanumeric characters
    #Returns a boolean if the name is valid or not
def validNameChecker(string):
    for char in string:
        if not (char.isspace() or char.isalnum()):
            return False
    return True

# --- validAccountNumberChecker Function ---
    #Takes an account number as parameter, and compares it to account numbers contained in the accounts list file 
    #Returns a boolean if the account number is found, thus valid or not
def validAccountNumberChecker(accountNum):
    global accountsList
    if accountsList:
        for i in range(0, len(accountsList)):
            if accountsList[i] == accountNum:
                return True
    return False

# ----- Main Function -----
    #Designed to run continously without termination and controls the flow and execution of the system by prompting the user which transaction to perform 
    #Will produce an error if an invalid command is inputted
def main():
    global loginState
    commands = ["login", "logout", "createacct", "deleteacct", "deposit", "withdraw", "transfer"]
    functions = {"login": login, "logout": logout, "createacct": createacct, "deleteacct": deleteacct, "deposit": deposit, "withdraw": withdraw, "transfer": transfer}
    readAccounts()  # Read in accounts file
    print("Welcome to QBASIC. Please login.")
    # - Core Loop -
    while True:
        # - Login Loop -
        while loginState == 0:  # Only login accepted
            userInput = input(">> ").lower()
            if userInput.rstrip() == "login":
                login()
            elif userInput.rstrip() == "close":
                exit()
            else:
                print("Invalid Command. Please login.")
        # Check login State
        if loginState == 1:
            print("Withdraw, Deposit, Transfer, or Logout?")
        elif loginState == 2:
            print("Withdraw, Deposit, Transfer, Createacct, Deleteacct, or Logout?")
        # Regular Input
        userInput = input(">> ").lower()
        if userInput.rstrip() == "close":
            exit()
        elif userInput.rstrip() not in commands:
            print("Invalid Command. Please use a valid command.")
        else:
            functions[userInput.rstrip()]()

main()
