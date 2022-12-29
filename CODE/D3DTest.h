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
	XMFLOAT4 mUVOffsets;	
};