CREATE TABLE Tag(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Ingredient(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
);

CREATE TABLE Recipe (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    image TEXT NOT NULL,
    description TEXT NOT NULL,
);

CREATE TABLE RecipeTag(
    recipe_id INTEGER NOT NULL
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, tag_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE,

);

CREATE TABLE RecipeIngredient(
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    unit TEXT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id) ON DELETE CASCADE,
);

CREATE TABLE User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
);

CREATE TABLE UserRecipe(
    user_id INTEGER NOT NULL,
    recipe_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
);

CREATE TABLE UserLikedRecipe(
    user_id INTEGER NOT NULL,
    recipe_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
);
