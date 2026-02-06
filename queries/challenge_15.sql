-- A query that creates or replaces a user-defined SQL function, count_vowels

-- The function should accept a string and return an integer representing the number of vowels in the string

-- Y should be counted as a vowel

-- Vowels are not case-sensitive

CREATE OR REPLACE FUNCTION count_vowels(varchar)
RETURNS INT 
IMMUTABLE 
AS $$
    SELECT LENGTH($1) - LENGTH(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(UPPER($1), 'A', ''),
                        'E', ''),
                    'I', ''),
                'O', ''),
            'U', ''),
        'Y', '')
    );
$$ LANGUAGE SQL;

    