# Copy the below lines into your .bashrc file in your root (~) directory.
# Prompts the user to choose which ROS distro to use.

# ROS settings
echo "Which ROS version do you want to use? [1, 2, default]"
echo "  1 : ROS 1, defaults to Noetic"
echo "  f : ROS 2 Foxy"
echo "  g : ROS 2 Galactic"
echo "  r : ROS 2 Rolling"
echo "  n : No ROS configuration"
read ros_type

if [ $ros_type == 1 ]; then
    echo "Defaulting to ROS Noetic"
    export ROS_DISTRO=noetic
elif [ "$ros_type" == "f" ]; then
        export ROS_DISTRO=foxy
elif [ "$ros_type" == "g" ]; then
        export ROS_DISTRO=galactic
elif [ "$ros_type" == "r" ]; then
        export ROS_DISTRO=rolling
else
    echo "No ROS distro sourced"
fi

if [ ! -z "$ROS_DISTRO" ]; then
    echo "Selecting ROS $ROS_DISTRO"
    source /opt/ros/$ROS_DISTRO/setup.bash
    export ROS_HOME=$HOME/code/ros/$ROS_DISTRO
    export ROS_LOG_DIR=$ROS_HOME/log
    source $ROS_HOME/install/setup.bash
    cd $ROS_HOME
fi
