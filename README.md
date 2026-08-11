# MAC / AI Accelerator

I'm building this project step by step to understand how the basic hardware behind AI accelerators actually works.

The starting point is a simple **Multiply-Accumulate (MAC)** unit:

**MAC = Multiplication + Accumulation**

The idea is straightforward:

    ACC = ACC + (A × B)

Instead of using Verilog's built-in multiplication and addition operators, I'm building the datapath from smaller hardware blocks so I can understand what's happening at the RTL level.

## Current Progress

### 1. 8×8 Dadda Multiplier

The multiplier takes two 8-bit inputs and produces a 16-bit product.

```text
A[7:0] ──┐
         │
         ▼
    Dadda Multiplier
         │
         ▼
    Product[15:0]


