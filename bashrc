# Copy the below lines into your .bashrc file in your root (~) directory.
# Prompts the user to choose which ROS distro to use.

# ROS settings
echo "Which ROS version do you want to use? [1, 2, default]"
echo "  1 : ROS 1, then specify distro"
echo "  2 : ROS 2, then specifiy distro"
echo "  d : default configuration"
echo "  n : No ROS configuration"
read ros_type

if [ $ros_type == 1 ]; then
    echo "Defaulting to ROS Noetic"
    export ROS_DISTRO=noetic
elif [ $ros_type == 2 ]; then
    echo "Which ROS2 distro do you want? [d, f, g, r]"
    read ros2_distro
    if [ "$ros2_distro" == "f" ]; then
            export ROS_DISTRO=foxy
    elif [ "$ros2_distro" == "g" ]; then
            export ROS_DISTRO=galactic
    elif [ "$ros2_distro" == "r" ]; then
            export ROS_DISTRO=rolling
    fi
elif [ "$ros_type" == "d" ]; then
    echo "Default ROS setup chosen"
    echo "Current defaults set to:"
    echo "  ROS2 Galactic"
    export ROS_DISTRO=galactic
fi

if [ "$ros_type" == "n" ]; then
    echo "No ROS distro sourced"
else
    source /opt/ros/$ROS_DISTRO/setup.bash
    export ROS_HOME=$HOME/code/ros/$ROS_DISTRO
    export ROS_LOG_DIR=$ROS_HOME/log
    source $ROS_HOME/install/setup.bash
    cd $ROS_HOME
fi

