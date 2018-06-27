// sudo apt-get install libjsoncpp-dev
// how to compile : 
// $ g++ -o exefileName sourceFile.cpp -ljsoncpp
// ex) $ g++ -o nodeMined nn.cpp -ljsoncpp
//
// how to run
// $ ./nodeMined
#include <iostream>
#include <fstream>
#include <jsoncpp/json/json.h>
#include <vector>
#include <stdio.h>      /* printf */
#include <stdlib.h> 
#include <unistd.h>
using namespace std;
string myExec(const char* cmd) {
    char buffer[512];
    std::string result = "";
    FILE* pipe = popen(cmd, "r");
    if (!pipe) throw std::runtime_error("popen() failed!");
    try {
        while (!feof(pipe)) {
            if (fgets(buffer, 128, pipe) != NULL)
                result += buffer;
        }
    } catch (...) {
        pclose(pipe);
        throw;
    }
    pclose(pipe);
    return result;
}
int main() {
    Json::Reader reader;
    Json::Value obj;
    
    //system("~/komodo/src/komodo-cli listtransactions > ~/NODE/txlist.json");
    //ifstream ifs("txlist.json");
    //ifstream ifs("txlist.json");
    //reader.parse(ifs, obj);     // Reader can also read strings
    string jsonOutput = myExec("~/komodo/src/komodo-cli listtransactions");
    reader.parse(jsonOutput, obj);     // Reader can also read strings
    int size = obj.size();
    int i=0, j=0;
    vector<string> blockHash;
    vector<double> amount;
    double total = 0;
    for (i=0; i< size; i++)
    {
            if (obj[i]["generated"].asBool() == false) continue;
            double amountIn = 0;
            blockHash.push_back(obj[i]["blockhash"].asString());
            amountIn = obj[i]["amount"].asDouble();
            amount.push_back(amountIn);
            total += amountIn;
            j++;
    }
    Json::Value objOut;
    cout << fixed;
    cout.precision(8);
    for (i=0; i< j; i++)
    {
        cout << i + 1 << " - blockHash : " << blockHash.at(i) << "\tAmount : " << amount.at(i) << endl;
        //cout << i << " - sender : " << address.at(i) << endl;
        //cout << i << " - amount : " <<  amount.at(i) << endl << endl;
    }
    cout << "Total : " << total << endl;
    return 1;
}
