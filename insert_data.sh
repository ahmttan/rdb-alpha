#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
if [[ $1 == "test" ]]
then
    echo "$($PSQL "TRUNCATE TABLE games, teams;")"
fi

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPNENT_GOALS
do
echo "exec for $YEAR,'$ROUND',$WINNER,$OPPONENT,$WINNER_GOALS,$OPPNENT_GOALS"
#pass first line
if [[ $YEAR != year ]]
then
#get winnerteam
WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER';")
# insert team table if no have
if [[ -z $WINNER_TEAM_ID ]]
then
INSERT_WINNER_RESULT=$($PSQL "insert into teams (name) values ('$WINNER');")
if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
then
echo "Inserted into teams, $WINNER"
fi
WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER';")
fi
# get opponent team
OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT';")
# insert team table if no have
if [[ -z $OPPONENT_TEAM_ID ]]
then
INSERT_OPPONENT_RESULT=$($PSQL "insert into teams (name) values ('$OPPONENT');")
if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
then
echo "Inserted into teams, $OPPONENT"
fi
OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT';")
fi

# insert game

INSERT_GAME_RESULT=$($PSQL "insert into games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPNENT_GOALS);")
if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
then
echo "Inserted into games, $YEAR,'$ROUND',$WINNER,$OPPONENT,$WINNER_GOALS,$OPPNENT_GOALS"
else
echo "FAIL: Insert into games, $YEAR,'$ROUND',$WINNER,$OPPONENT,$WINNER_GOALS,$OPPNENT_GOALS"
fi

fi
done

