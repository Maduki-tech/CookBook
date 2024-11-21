CREATE TABLE Tag (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Ingredient (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Recipe (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    image TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE RecipeTag (
    recipe_id INTEGER NOT NULL REFERENCES Recipe(id) ON DELETE CASCADE,
    tag_id INTEGER NOT NULL REFERENCES Tag(id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, tag_id)
);

CREATE TABLE RecipeIngredient (
    recipe_id INTEGER NOT NULL REFERENCES Recipe(id) ON DELETE CASCADE,
    ingredient_id INTEGER NOT NULL REFERENCES Ingredient(id) ON DELETE CASCADE,
    amount INTEGER NOT NULL,
    unit TEXT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id)
);

CREATE TABLE AppUser (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE AppUserRecipe (
    user_id INTEGER NOT NULL REFERENCES AppUser(id) ON DELETE CASCADE,
    recipe_id INTEGER NOT NULL REFERENCES Recipe(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, recipe_id)
);

CREATE TABLE AppUserLikedRecipe (
    user_id INTEGER NOT NULL REFERENCES AppUser(id) ON DELETE CASCADE,
    recipe_id INTEGER NOT NULL REFERENCES Recipe(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, recipe_id)
);

