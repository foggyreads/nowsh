#!/bin/sh

Ticket()
{
    Ticket__main $@;
}

Ticket__main()
{
    if [ ! -d ./.git ];
    then
        echo "No git here. Init?";
        return;
    fi;
    ticket_exists=$(git branch | awk -v branch=$1 '$2 ~ branch {print $2;}; $1 ~ branch {print $1;}' | uniq);
    
    if [ $(git status | grep -q "nothing to commit" | wc -w) -eq 0 ];
    then
        if [ "" != "$ticket_exists:" ];
        then
            echo "Found: $ticket_exists";
            git checkout $ticket_exists;
        else
            read "p?Name the branch: ";
            git checkout master && git pull && git checkout -b feature/$p;
        fi;
    else
        echo "Status not clean.";
    fi;
}