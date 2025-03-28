#pragma once

#include <d3d11_1.h>
#include <d3dcompiler.h>
#include <DirectXMath.h>
#include <directxcolors.h>
#include "resource.h"

using namespace DirectX;

struct SimpleVertex
{
	XMFLOAT3 Pos;
	XMFLOAT2 UV;
};

struct ConstantBuffer
{
	XMMATRIX mWorld;
	XMMATRIX mProjection;

	XMFLOAT4 mUVParams;
	XMFLOAT4 mPalParams;
	XMFLOAT4 mColor;
	XMFLOAT4 mExtraParams;
};


template <typename T,int FixedSize> class StaticArray 
{
private:
	T* Ptr;
	int Count;

	inline void Alloc()
	{
		if (Ptr) return;
		Ptr = (T*)calloc(FixedSize, sizeof(T));
	}

public:
	StaticArray() : 
		Ptr(nullptr),
		Count(0)
	{

	}

	~StaticArray()
	{
		if (Ptr) free(Ptr);
	}
	
	inline T& operator[](int Index)
	{
		Alloc();
		return Ptr[Index];
	}

	int Add(T& Element)
	{
		Alloc();
		if (Count >= FixedSize) return -1;
		Ptr[Count++] = Element;
		return Count - 1;
	}

	T* AddEmpty()
	{
		Alloc();
		if (Count >= FixedSize) return nullptr;
		return &Ptr[Count++];
	}

	int Find(const T& Value)
	{
		for (int i = 0; i < Count; i++)
		{
			if (Ptr[i] == Value) return i;
		}

		return -1;
	}

	int Num() { return Count; }
};