#include "Tokenizer.h"
#include <fstream>

void hello();
void end();
void RUN();
void Input(char input[]);
void Prompt();
void print_Data();
void print_Labels();
void print_Text();
void print_Registers();
void print_Operations();

int main()
{
    char input[MAX_BUF];
    clear();
    hello();
    if(!mode)
    {
        while (1)
        {
            Input(input);

            if (*(input) == '\0' && !(prompt))
                break;
            if (!enterData)
            {
                tokenize(input);
                RUN();
            }
            else
            {
                dataParse(input);
            }
            
            if (exitCase && !(prompt))
                break;
            prompt = 0;
            
        }
    }
    else
    {
        std::cout << "Batch mode not implemented" << std::endl;
    }
    
    printProgram();
    end();   
}

void hello()
{
    std::cout << "                      MySPIM simulator 1.0" << std::endl;
    std::cout << "To print: type show\n show r - for registers\n show d - for data\n show t - for text \n show o - for operations)\n"; 
    std::cout << "  MODE:\n0 - Immediate\n1 - Batch\nMode: ";
    std::cin >> mode;
    prompt = 1;
}

void end()
{
    char option;
    if (mode == 1) goto exit;
    std::cout << "Execute the program again? Enter y/n: ";
    std::cin  >> option;
    if (option == 'y')
    {
        secondTime = 1;
        program_counter = 0;
        char input[MAX_BUF];
        for (int i = 0; i < Program.size(); ++i)
        {
             std::string s = *(Program[i]); 
             strcpy(input, s.c_str());
             tokenize(input);
             RUN();
        }
    }
    std::cout << "Save your program ? Enter y/n: ";
    std::cin  >> option;
    if (option == 'y')
    {
        std::ofstream batchFile("batch.s");
        if (batchFile.is_open())
        {
            batchFile << "\t.text\n";
            batchFile << "\t.globl main\n";
            batchFile << "main: \n";
            for (int i = 0; i < Program.size(); ++i)
            {
                batchFile << '\t' <<*(Program[i]) << '\n';
            }
            batchFile <<"\n\t.data\n";
            for (int i = 0; i < DataLabels.size(); ++i)
            {
                batchFile << '\t' <<*(DataLabels[i]) << ':' << "\t.word ";
                for (int j = dpos[i]; j < EndPos[i]; ++j)
                {
                    batchFile << Data[j];
                    if (j != EndPos[i] - 1)
                        batchFile << ',';
                }
                batchFile << '\n';
            }
        }
        
    }
    
  exit:    std::cout << "END" << std::endl;
}

void RUN()
{
    if (operations[0] == -2)
    {
        // printing instructions
        switch(operations[5])
        {
            case 0:
                print_Text();
                break;
            case 1:
                print_Labels();
                break;
            case 2:
                print_Registers();
                break;
            case 3:
                print_Data();
                break;
        }
        
    }
    if (operations[0] == -1)
            syscall();
        if(operations[0] == 0 && execute)
        {
            //r-format Instructions
            switch(operations[5])
            {
                case 0:
                    sll();
                    break;
                case 2:
                    slr();
                    break;
                case 18:
                    mflo();
                    break;
                case 19:
                    mfhi();
                    break;
                case 26:
                    mult();
                    break;
                case 28:
                    div();
                    break;
                case 32:
                    add();
                    break;
                case 34:
                    sub();
                    break;
                case 36:
                    andF();
                    break;
                case 37:
                    orF();
                    break;
                case 38:
                    xorF();
                    break;
                case 39:
                    nor();
                    break;
                case 42:
                    slt();
                    break;
            }
        }

        if(operations[0] == 1 && execute)
        {
            switch (operations[5])
            {
            //i-format instructions
                case 1:
                    la();
                    break;
                case 2:
                    lw();
                    break;
                case 3:
                    sw();
                    break;
                case 32:
                    addi();
                    break;
                case 34:
                    subi();
                    break;
                case 48:
                    load_immediate();
                    break;
            }
        }
        if (operations[0] == 2 && (execute || !branched))
        {
            switch (operations[5])
            {
                case 0:
                    jump();
                    break;
                case 1:
                    beq();
                    break;
                case 2:
                    bne();
                    break;
                case 3:
                    blt();
                    break;
                case 4:
                    bgt();
                    break;
                case 5:
                    ble();
                    break;
                case 6:
                    bge();
                    break;
                    
            }
        }
}

void print_Registers()
{
    for(int i = 0; i <  32; ++i)
    {
        std::cout << '$' <<  i << ": " << registers[i] << std::endl;
    }
    prompt = 1;
}

void print_Labels()
{
    for (int i = 0; i < Labels.size(); ++i)
    {
        std::cout << position[i] << ' ' << *(Labels[i]) << std::endl;
    }
    prompt = 1;
}

void print_Data()
{
    //std::cout << "TO DO" << std::endl;
    std::cout << "You have " << DataLabels.size() << " data labels." << std::endl;
    for (int i = 0; i < DataLabels.size(); ++i)
    {
        std::cout << *(DataLabels[i]) << ' ';
        std::cout << dpos[i] << ' ';
        //Print out data
        for(int j = dpos[i]; j < EndPos[i]; ++j)
        {
            std::cout << char(Data[j]);
        }
        std::cout << std::endl;
    }
}

void print_Text()
{
    for (int i = 0; i < Program.size(); ++i)
    {
        std::cout << *(Program[i]) << std::endl;
    }
}

void print_Operations()
{
    for (int i = 0; i < 6; ++i)
    {
        std::cout << operations[i] << ' ';
    }
    std::cout << std::endl;
}

void Input(char input[])
{
    if (!prompt)
    {
        if (!enterData)
            std::cout << "Text: " << program_counter;
        else
            std::cout << "Data: ";
        std::cout << " >> ";
    }
// read string from keyboard and put into input array of characters
        std::cin.getline(input, MAX_BUF);
        //if (std::cin.eof()) break;
        if (std::cin.fail() || std::cin.bad())
        {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(),
                            '\n');
        }
}
