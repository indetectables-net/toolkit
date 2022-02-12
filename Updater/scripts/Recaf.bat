@ECHO OFF
echo "Fix Recaf main exe name"
cd "updates\recaf-*"
move recaf-*-J8-jar-with-dependencies.jar recaf-J8-jar-with-dependencies.jar
