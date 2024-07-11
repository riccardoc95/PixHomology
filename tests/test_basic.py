import os

import pixhomology as m


def test_main():
    assert m.__version__ == os.environ["GIT_DESCRIBE_TAG"]
