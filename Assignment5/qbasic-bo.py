# QBASIC Back-Office Terminal

# --- Argument List ---
# Arg 1: Old Master Account List
# Arg 2: Transaction Summary
# Arg 3: New Master Account List
# Arg 4: New Valid Account List

# --Library Imports
import sys


# ----- Global Vars -----
constraintsFailed = []      # Tracks failed Constraints
transactionList = []        # Hold all transactions from transaction summary file
accountsList = []           # Holds master account file & updates it
validAccountsList = []      # Hold all valid account numbers for front-end


# ----- Functions -----

# --- createacct Function ---
def createacct(line):
    global accountsList
    global validAccountsList
    global constraintsFailed
    for account in accountsList:    # Search for account number
        if line[1] == account[0]:   # Check if account number matches
            print("Invalid Account Creation. Account number " + str(line[1]) + " already exists.")
            constraintsFailed.append(' '.join(line))
            constraintsFailed.append("Invalid Account Creation. Account number " + str(line[1]) + " already exists.")
            return 1
    accountsList.append([line[1], line[2], line[4]])
    validAccountsList.append(line[1])
    return 0


# --- deleteacct Function ---
def deleteacct(line):
    global accountsList
    global validAccountsList
    for account in accountsList:    # Search for account number
        if line[1] == account[0]:   # Check if exists
            account[1] = '000'
            validAccountsList.remove(line[1])
            return 0
    # If no match is found. Toss error.
    print("Invalid Account Deletion. Account number " + str(line[1]) + " doesn't exist.")
    constraintsFailed.append(' '.join(line))
    constraintsFailed.append("Invalid Account Deletion. Account number " + str(line[1]) + " doesn't exist.")
    return 1


# --- deposit Function ---
def deposit(line):
    global accountsList
    if int(line[2]) < 100 or int(line[2]) > 99999999:   # Check transfer amount is within 3 to 8 digit range
        print("Invalid Deposit of $" + str(float(line[2])/100) + ". Must be between $1.00 and $999999.99.")
        constraintsFailed.append(' '.join(line))
        constraintsFailed.append("Invalid Deposit of $" + str(float(line[2])/100) + ". Must be between $1.00 and $999999.99.")
        return 1
    for account in accountsList:    # Search for account number
        if line[1] == account[0]:
            account[1] = str(int(account[1]) + int(line[2]))
            break
    return 0


# --- withdraw Function ---
def withdraw(line):
    global accountsList
    if int(line[2]) < 100 or int(line[2]) > 99999999:   # Check transfer amount is within 3 to 8 digit range
        print("Invalid Withdraw of $" + str(float(line[2])/100) + ". Must be between $1.00 and $999999.99.")
        constraintsFailed.append(' '.join(line))
        constraintsFailed.append("Invalid Withdraw of $" + str(float(line[2])/100) + ". Must be between $1.00 and $999999.99.")
        return 1
    for account in accountsList:
        if line[1] == account[0]:   # Search for account number
            if int(account[1]) - int(line[2]) >= 0: # Check if account has enough funds.
                account[1] = str(int(account[1]) - int(line[2]))
                break
            else:
                print("Invalid Withdraw. Account " + str(line[1]) + " doesn't have enough funds to withdraw $" + str(float(line[2])/100) + ".")
                constraintsFailed.append(' '.join(line))
                constraintsFailed.append("Invalid Withdraw. Account " + str(line[1]) + " doesn't have enough funds to withdraw $" + str(float(line[2])/100) + ".")
                return 2
    return 0


# --- transfer Function ---
def transfer(line):
    if int(line[2]) < 100 or int(line[2]) > 99999999:   # Check transfer amount is within 3 to 8 digit range
        print("Invalid Transfer of $" + str(float(line[2])/100) +". Must be between $1.00 and $999999.99.")
        constraintsFailed.append(' '.join(line))
        constraintsFailed.append("Invalid Transfer of $" + str(float(line[2])/100) +". Must be between $1.00 and $999999.99.")
        return 1
    fromXFR = None
    toXFR = None

    for account in accountsList:    # Check if transfer from account exists
        if line[1] == account[0]:
            fromXFR = accountsList.index(account)
            break
    for account in accountsList:    # Check if transfer to account exists
        if line[3] == account[0]:
            toXFR = accountsList.index(account)
            break

    if fromXFR == None or toXFR == None:    # Check that both accounts exist by checking if fromXFR & toXFR has been changed
        print("Invalid Transfer. Transfer from/to account number doesn't exist.")
        constraintsFailed.append(' '.join(line))
        constraintsFailed.append("Invalid Transfer. Transfer from/to account number doesn't exist.")
        return 2

    if int(accountsList[fromXFR][1]) - int(line[2]) >= 0:   # Check if fromXFR account has enough funds
        accountsList[toXFR][1] = str(int(accountsList[toXFR][1]) + int(line[2]))
        accountsList[fromXFR][1] = str(int(accountsList[fromXFR][1]) - int(line[2]))
    else:
        print("Invalid Transfer. Account " + str(line[1]) + " doesn't have enough funds to transfer $" + str(float(line[2])/100) + ".")
        constraintsFailed.append(' '.join(line))
        constraintsFailed.append("Invalid Transfer. Account " + str(line[1]) + " doesn't have enough funds to transfer $" + str(float(line[2])/100) + ".")
        return 3
    return 0


# --- endofsession Function ---
def endofsession():
    global accountsList
    global validAccountsList
    global constraintsFailed
    accountsList.sort(key=lambda l:l[0])        # Sort master list by first index
    with open(sys.argv[3], 'w+') as file:       # Write new master accounts file
        for row in accountsList:
            file.write(' '.join(row) + "\n")
        file.close()

    validAccountsList.sort()                    # Sort valid list
    with open(sys.argv[4], 'w+') as file:       # Write new valid accounts file
        for row in validAccountsList:
            file.write(row + "\n")
        file.write("0000000")
        file.close()
    if constraintsFailed != []:
        with open("constraintsFailed.txt", 'w+') as file:   # Write contrainstsFailed
            for row in constraintsFailed:
                file.write(row + "\n")
            file.close()
        print(str(int(len(constraintsFailed)/2)) + " Constraint Errors. Errors written in constraintsFailed.txt file.")
    return 0


# --- inputFileManager Function ---
    # Takes in parameter file names and places the file contents into a list
def inputFileManager():
    global accountsList
    global transactionList
    global validAccountsList
    if len(sys.argv) != 5:  # Check for exact number of args
        print("Invalid number of arguments. Must have a total of four arguments.")
        constraintsFailed.append("Arguments: " + str(len(sys.argv)-1))
        constraintsFailed.append("Invalid number of arguments. Must have a total of four arguments.")
        return 1
    try:                    # Check and place account file into a list
        with open(sys.argv[1], 'r') as file:
            accountsList = [line.strip().split() for line in file]
    except:
        print("Invalid account file input. File doesn't exist.")
        constraintsFailed.append("Argument 1: " + sys.argv[1])
        constraintsFailed.append("Invalid account file input. File doesn't exist.")
        return 2
    try:                    # Check and place transactions file into a list
        with open(sys.argv[2], 'r') as file:
            transactionList = [line.strip().split() for line in file]
    except:
        print("Invalid transaction file input. File doesn't exist.")
        constraintsFailed.append("Argument 2: " + sys.argv[2])
        constraintsFailed.append("Invalid account file input. File doesn't exist.")
        return 3

    for num in accountsList:
        validAccountsList.append(num[0])
    return 0


# ----- Main Function -----
def main():
    global transactionList
    keyNames = {'NEW', 'DEL', 'DEP', 'WDR', 'XFR', 'EOS'}
    functions = {"NEW": createacct, "DEL": deleteacct,
                 "DEP": deposit, "WDR": withdraw, "XFR": transfer, "EOS": endofsession}

    inputCode = inputFileManager()
    if inputCode != 0:                                              # Check for file input errors
        with open("constraintsFailed.txt", 'w+') as file:
            for row in constraintsFailed:
                file.write(row + "\n")
            file.close()
        print("Force Exit. Back Office failed with an error.")
        exit()
    elif transactionList[len(transactionList)-1][0] != 'EOS':       # Check if EOS is the final transaction
        print("Invalid transaction file. Last transaction is not an EOS transaction.")
        constraintsFailed.append("Last Transaction: " + ' '.join(transactionList[len(transactionList)-1]))
        constraintsFailed.append("Invalid transaction file. Last transaction is not an EOS transaction.")
        with open("constraintsFailed.txt", 'w+') as file:
            for row in constraintsFailed:
                file.write(row + "\n")
            file.close()
        print("Force Exit. Back Office failed with an error.")
        exit()

    # Cycle through each transaction
    for line in transactionList:
        if line[0] not in keyNames:
            print("Invalid transaction file. Transaction command doesn't exist.")
            constraintsFailed.append("Failed Transaction: " + line[0])
            constraintsFailed.append("Invalid transaction file. Transaction command doesn't exist.")
            with open("constraintsFailed.txt", 'w+') as file:
                for row in constraintsFailed:
                    file.write(row + "\n")
                file.close()
            print("Force Exit. Back Office failed with an error.")
            exit()
        elif line[0] == 'EOS':
            endofsession()
        else:
            functions[line[0]](line)
    print("Back Office ran successfully.")

main()
