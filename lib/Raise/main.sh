#/usr/bin

raise__path=$nowpath/lib/Raise;

Raise()
{
    Raise__main $@;
}

Raise__create()
{
    cd /Workspace/Code;
    if [ ! -d /Workspace/Code/$1 ];
    then
        mkdir -p /Workspace/Code/$1/{www,sql};
        cd /Workspace/Code/$1 && echo "Created.";
        ## Docker
        cp $raise__path/files/docker/* /Workspace/Code/$1;
        ## Symfony
        cd www && composer create-project symfony/skeleton $1 -s dev;
        ## React
        # TODO: Remove the install -g to Workspace Creation.
        cd ../ #&& sudo npm install -g create-react-app;
        npm install @material-ui/icons;
        create-react-app pub
            && cd pub
            && npm install @material-ui/core
            && npm start
        
        # docker build --tag=$1
    fi;
}

Raise__main()
{
    p=$(find /Workspace/Code -maxdepth 2 -type d -iname "*$1*" | head -n 1);
    if [ -d $p/www ];
    then
        echo "Project exists: not raising anything.";
        return;
        ## Here logic to docker up!
        # docker run 4000:80 $1
    else
        Raise__create $1;
    fi;

}