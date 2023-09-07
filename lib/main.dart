class Node {
  late int dayOfTravel;
  late int amount;
  Node? dayPassNode;
  Node? sevenDayPassNode;
  Node? thirtyDayPassNode;
}

Node createNode(int dayOfTravel) {
  Node newNode = Node();
  newNode.dayOfTravel = dayOfTravel;
  newNode.amount = 0;
  return newNode;
}

Node? addOneDayPassNode(
    List<int> days, List<int> costs, int currentDayIndex, Node root) {
  int currentOneDayIndex = indexOnOneDayTravel(days, currentDayIndex);

  if (currentOneDayIndex == -1) {
    return null;
  }

  root.dayPassNode = createNode(days[currentOneDayIndex]);
  root.dayPassNode!.amount = root.amount + costs[0];
  Node newNode = root.dayPassNode!;
  newNode.dayPassNode =
      addOneDayPassNode(days, costs, currentOneDayIndex, newNode);
  newNode.sevenDayPassNode =
      addSevenDayPassNode(days, costs, currentOneDayIndex, newNode);
  newNode.thirtyDayPassNode =
      addThirtyDayPassNode(days, costs, currentOneDayIndex, newNode);
  return newNode;
}

Node? addSevenDayPassNode(
    List<int> days, List<int> costs, int currentDayIndex, Node root) {
  int currentSevenDayIndex = indexOnSevenDayTravel(days, currentDayIndex);

  if (currentSevenDayIndex == -1) {
    return null;
  }

  root.sevenDayPassNode = createNode(days[currentSevenDayIndex]);
  root.sevenDayPassNode!.amount = root.amount + costs[1];
  Node newNode = root.sevenDayPassNode!;
  newNode.dayPassNode =
      addOneDayPassNode(days, costs, currentSevenDayIndex, newNode);
  newNode.sevenDayPassNode =
      addSevenDayPassNode(days, costs, currentSevenDayIndex, newNode);
  newNode.thirtyDayPassNode =
      addThirtyDayPassNode(days, costs, currentSevenDayIndex, newNode);
  return newNode;
}

Node? addThirtyDayPassNode(
    List<int> days, List<int> costs, int currentDayIndex, Node root) {
  int currentThirtyDayIndex = indexOnThirtyDayTravel(days, currentDayIndex);

  if (currentThirtyDayIndex == -1) {
    return null;
  }

  root.thirtyDayPassNode = createNode(days[currentThirtyDayIndex]);
  root.thirtyDayPassNode!.amount = root.amount + costs[2];
  Node newNode = root.thirtyDayPassNode!;
  newNode.dayPassNode =
      addOneDayPassNode(days, costs, currentThirtyDayIndex, newNode);
  newNode.sevenDayPassNode =
      addSevenDayPassNode(days, costs, currentThirtyDayIndex, newNode);
  newNode.thirtyDayPassNode =
      addThirtyDayPassNode(days, costs, currentThirtyDayIndex, newNode);
  return newNode;
}

// Get next day of travel we need to buy ticket on
int indexOnOneDayTravel(List<int> days, int currentDayIndex) {
  int lastDay = days.last;
  int newDay = days[currentDayIndex] + 1;
  if (newDay >= lastDay) return -1;
  while (true) {
    if (days[currentDayIndex++] >= newDay) return currentDayIndex - 1;
  }
}

int indexOnSevenDayTravel(List<int> days, int currentDayIndex) {
  int lastDay = days.last;
  int newDay = days[currentDayIndex] + 7;
  if (newDay >= lastDay) return -1;
  while (true) {
    if (days[currentDayIndex++] >= newDay) return currentDayIndex - 1;
  }
}

int indexOnThirtyDayTravel(List<int> days, int currentDayIndex) {
  int lastDay = days.last;
  int newDay = days[currentDayIndex] + 30;
  if (newDay >= lastDay) return -1;
  while (true) {
    if (days[currentDayIndex++] >= newDay) return currentDayIndex - 1;
  }
}

void minCostTickets(List<int> days, List<int> costs) {
  Node root = createNode(days[0]);
  root.dayPassNode = addOneDayPassNode(days, costs, 0, root);
  root.sevenDayPassNode = addSevenDayPassNode(days, costs, 0, root);
  root.thirtyDayPassNode = addThirtyDayPassNode(days, costs, 0, root);

  print(root.dayOfTravel);
  print("");
  print(root.dayPassNode!.dayOfTravel);
  print(root.sevenDayPassNode!.dayOfTravel);
  print(root.thirtyDayPassNode!.dayOfTravel);
  print("");
  print(root.dayPassNode!.dayPassNode!.dayOfTravel);
  print(root.dayPassNode!.sevenDayPassNode!.dayOfTravel);
  print(root.dayPassNode!.thirtyDayPassNode!.dayOfTravel);
  print("");
  print(root.sevenDayPassNode!.dayPassNode!.dayOfTravel);
  print(root.sevenDayPassNode!.sevenDayPassNode!.dayOfTravel);
  print(root.sevenDayPassNode!.thirtyDayPassNode!.dayOfTravel);
  print("");
  print(root.thirtyDayPassNode!.dayPassNode!.dayPassNode!.dayOfTravel);
  print(root.thirtyDayPassNode!.dayPassNode!.dayPassNode!.amount);
}

void main() {
  List<int> days = [2, 7, 9, 11, 17, 23, 28, 31, 40, 221];
  List<int> costs = [2, 7, 15];
  minCostTickets(days, costs);
}
