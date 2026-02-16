#include <iostream>

using namespace std;
struct knoop {
    knoop* links;
    knoop* rechts;
    char info;
    int niveau;
};  // knoop

void printniveau_p(knoop* ingang) {
    if (!ingang) return;
    cout << ingang->niveau << " ";
    printniveau_p(ingang->links);
    printniveau_p(ingang->rechts);
}

// Opgave 1
int aantalbladeren_p(knoop* ingang) {
    if (!ingang) return 0;

    int bladerenLinks = aantalbladeren_p(ingang->links);
    int bladerenRechts = aantalbladeren_p(ingang->rechts);
    int aantalBladeren = bladerenLinks + bladerenRechts;

    if (aantalBladeren == 0) aantalBladeren++;
    return aantalBladeren;
}  // aantalbladeren_p

// Opgave 2
int hoogte_p(knoop* ingang) {
    if (!ingang) return -1;
    int linkerHoogte = hoogte_p(ingang->links);
    int rechterHoogte = hoogte_p(ingang->rechts);
    if (linkerHoogte < rechterHoogte) return rechterHoogte + 1;
    return linkerHoogte + 1;
}  // hoogte_p

// Opgave 3
void initniveau_p(knoop* ingang) {
    if (!ingang) return;
    ingang->niveau = 0;
    initniveau_p(ingang->links);
    initniveau_p(ingang->rechts);
}

// Opgave 4
void vulniveau_p(knoop* ingang, int niveau) {
    if (!ingang) return;
    ingang->niveau = niveau;
    vulniveau_p(ingang->links, niveau + 1);
    vulniveau_p(ingang->rechts, niveau + 1);
}

// Opgave 5
char max(char a, char b) { return (a < b) ? b : a; }

char maxinfowaarde_p(knoop* ingang) {
    if (!ingang) return '\0';
    char info = ingang->info;
    char linkerInfo = maxinfowaarde_p(ingang->links);
    char rechterInfo = maxinfowaarde_p(ingang->rechts);
    return max(info, max(linkerInfo, rechterInfo));
}

// Opgave 6
void doepostorde_p(knoop* ingang) {
    if (!ingang) return;
    doepostorde_p(ingang->links);
    doepostorde_p(ingang->rechts);
    cout << "info: " << ingang->info << ", niveau: " << ingang->niveau << endl;
}

// Opgave 7
knoop* bzoek_p(char waarde, knoop*& ouder) {
    knoop* huidig = ouder;
    ouder = nullptr;

    while (huidig) {
        if (huidig->info == waarde) return huidig;
        ouder = huidig;
        if (waarde < huidig->info) huidig = huidig->links;
        else huidig = huidig->rechts;
    }

    return nullptr;
}

// Opgave 8
knoop* kleinstegrotere(knoop* ingang, knoop*& ouder) {
    if (!ingang->links) return nullptr;

    knoop* huidig = ingang->links;
    ouder = ingang;

    while (huidig->rechts) {
        ouder = huidig;
        huidig = huidig->rechts;
    }

    return huidig;
}

// Opgave 9
knoop* grootstekleinere(knoop* ingang, knoop*& ouder) {
    if (!ingang->rechts) return nullptr;

    knoop* huidig = ingang->rechts;
    ouder = ingang;

    while (huidig->links) {
        ouder = huidig;
        huidig = huidig->links;
    }

    return huidig;
}

// Opgave 10
bool isbzboom_p(knoop* ingang) {
    if (!ingang) return true;
    knoop* ouder = nullptr;

    knoop* kleiner = grootstekleinere(ingang->links, ouder);
    if (kleiner && kleiner->info >= ingang->info) return false;

    knoop* groter = kleinstegrotere(ingang->rechts, ouder);
    if (groter && groter->info <= ingang->info) return false;

    return isbzboom_p(ingang->links) && isbzboom_p(ingang->rechts);
}

// Opgave 11

int main() {
    knoop* a = new knoop;
    knoop* b = new knoop;
    knoop* c = new knoop;
    knoop* d = new knoop;
    knoop* e = new knoop;
    knoop* f = new knoop;

    a->info = 'd';
    b->info = 'P';
    c->info = '!';
    d->info = 'Z';
    e->info = 'c';
    f->info = 'x';

    a->links = b;
    b->links = c;
    b->rechts = d;
    d->rechts = e;
    a->rechts = f;

    // initniveau_p(a);
    vulniveau_p(a, 0);
    knoop* nul = nullptr;
    grootstekleinere(a, nul);
    cout << nul->info;

    return 0;
}