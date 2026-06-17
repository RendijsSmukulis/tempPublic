-- Seed a top-level favorite that appears on the New Tab Page, but only if one with this
-- name doesn't already exist (so re-running --with-sql won't create duplicates).
-- (not reallty needed if we keep the DELETE above)
INSERT INTO Bookmarks (Description, [Index], IsFavorite, IsUnifiedFavorite, IsMobileFavorite, ParentId, URL)
SELECT 'SEEDED via remtote --with-sql', 0, 1, 1, 0, NULL, 'https://duckduckgo.com/'
WHERE NOT EXISTS (
    SELECT 1 FROM Bookmarks WHERE Description = 'SEEDED via remtote --with-sql'
);
