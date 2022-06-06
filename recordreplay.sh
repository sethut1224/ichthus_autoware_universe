if [ $1 = "record" ]; then
	echo "record"
	ros2 action send_goal /planning/recordtrajectory autoware_auto_planning_msgs/action/RecordTrajectory "{record_path: "/tmp/path"}" --feedback
elif [ $1 = "replay" ]; then
	echo "replay"
	ros2 action send_goal /planning/replaytrajectory autoware_auto_planning_msgs/action/ReplayTrajectory "{replay_path: "/tmp/path"}" --feedback
else
	echo "unknown type. type must be record or replay"
fi

