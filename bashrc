# Copy the below lines into your .bashrc file in your root (~) directory.
# Prompts the user to choose which ROS distro to use.

# NOTE: you can replace the commented code paths with wherever
#   you store your ros overlay.

# ROS settings
echo "Which ROS version do you want to use? [1, 2, default]"
echo "  1 : ROS 1, then specify distro"
echo "  2 : ROS 2, then specifiy distro"
echo "  * : default configuration"
read ros_type

if [ $ros_type == 1 ]; then
        echo "Defaulting to ROS Noetic"
        source /opt/ros/noetic/setup.bash
        source /home/$USER/code/ros/noetic/devel/setup.bash
elif [ $ros_type == 2 ]; then
        echo "Which ROS2 distro do you want? [d, f, r]"
        read ros2_distro
        if [ "$ros2_distro" == "d" ]; then
                source /opt/ros/dashing/setup.bash
                source /home/$USER/code/ros/dashing/install/setup.bash
        elif [ "$ros2_distro" == "f" ]; then
                source /opt/ros/foxy/setup.bash
                source /home/$USER/code/ros/foxy/install/setup.bash
        elif [ "$ros2_distro" == "r" ]; then
                source /opt/ros/rolling/setup.bash
                source /home/$USER/code/ros/rolling/install/setup.bash
        fi
else
        echo "Default ROS setup chosen"
        echo "Current defaults set to:"
        echo "  ROS2 Foxy"
        source /opt/ros/foxy/setup.bash
        source /home/$USER/code/ros/foxy/install/setup.bash
fi
