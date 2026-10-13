import pytest

from app.main import add


@pytest.mark.parametrize(
    "a, b, expected",
    [
        (0, 0, 0),
        (-1, 1, 0),
        (-2, -3, -5),
        (10**12, 1, 10**12 + 1),
    ],
)
def test_add_edge_cases(a, b, expected):
    assert add(a, b) == expected


def test_add_is_commutative():
    assert add(7, 11) == add(11, 7)
