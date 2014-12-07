#include "gtest/gtest.h"
#include "src/gtest_example.h"

TEST(AddTest, Test1)
{
    ASSERT_EQ(2, add(1, 1));
}
