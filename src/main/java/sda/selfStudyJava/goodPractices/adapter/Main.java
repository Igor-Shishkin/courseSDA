package sda.selfStudyJava.goodPractices.adapter;

public class Main {
    public static void main(String[] args) {
        Sparrow sparrow = new Sparrow();
        ToyDuck toyDuck = new PlasticToyDuck();

        // Wrap a bird in a birdAdapter so that it
        // behaves like toy duck
        ToyDuck birdAdapter = new BirdAdapter(sparrow);

        System.out.println("\nSparrow...");
        sparrow.fly();
        sparrow.makeSound();

        System.out.println("\nToyDuck...");
        toyDuck.squeak();

        // toy duck behaving like a bird
        System.out.println("\nBirdAdapter...");
        birdAdapter.squeak();
    }
}
